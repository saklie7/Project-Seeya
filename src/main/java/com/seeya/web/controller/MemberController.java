package com.seeya.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.seeya.member.model.Member;
import com.seeya.member.repository.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	MemberMapper memberMapper;

	@ModelAttribute("active")
	public String Active() {
		return "member";
	}

	@GetMapping("/member")
	public String getProfileView(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:login";
		}

		return "member_view";
	}

	@GetMapping("/delete")
	public String deleteMember(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		memberMapper.delete(member.getMemberid());
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/join")
	public String join() {
		return "member_join";
	}

	@PostMapping("/join")
	public String join(Member member, @RequestParam("profileImage") MultipartFile profileImage, HttpServletRequest req) {
		System.out.println(member);
		System.out.println(profileImage.getOriginalFilename());
		Set pathSet = req.getSession().getServletContext().getResourcePaths("/");
		System.out.println(pathSet);
		
		memberMapper.insert(member);
		
		if (profileImage != null) {
			String memberPic = uploadFileHadler(profileImage).getName();
			member.setMemberPic(memberPic);
			memberMapper.updateMemberPic(member);
		}
		
		if (member.getComment() != null) {
			memberMapper.updateComment(member);
		}
		
		return "redirect:/";
	}

	private File uploadFileHadler(MultipartFile profileImage) {
		try {
			byte[] bytes = profileImage.getBytes();
			UUID uuid = UUID.randomUUID();
			String name = uuid + "_" + profileImage.getOriginalFilename();

			String imagePath = "D:\\projectd\\workspace-seeya\\project-seeya\\src\\main\\resources\\static\\images";
			File dir = new File(imagePath + File.separator);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			System.out.println(dir.toString());
			
			// Create the file on server
			File serverFile = new File(dir + File.separator + name);
			System.out.println(serverFile.toString());
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();

			return serverFile;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@GetMapping("/edit")
	public String memberEdit(HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:/";
		}
		System.out.println(member);
		return "member_edit";
	}

	@PostMapping("/edit")
	public String postMemberEdit(Member member, HttpSession session) {
		System.out.println(member);
		memberMapper.update(member);
		Member mem = memberMapper.selectByMemberId(member.getMemberid());
		System.out.println(mem);
		session.removeAttribute("member");
		session.setAttribute("member", mem);
		return "redirect:/member";
	}

}

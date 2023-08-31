package com.example.demo.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/cloud")
public class CloudController {
	String name = "SAM";
	@GetMapping("/name")
	public String CloudName() {
		return "the cloud name is" + name;
	}
	@GetMapping("/age")
	public String CloudAge() {
		return "the cloud age is 500" ;
	}
	
	@PostMapping("/uname")
	public String ChangeCloudName(@RequestBody String NewName ) {
		this.name = NewName;
		return "the cloud name is updated successfully, the new cloud name is" + name;
	}
	
}

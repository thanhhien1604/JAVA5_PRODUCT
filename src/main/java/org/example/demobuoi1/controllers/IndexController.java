package org.example.demobuoi1.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    @GetMapping("/index")
    public String index() {
        return "index";
    }


    @GetMapping("trang-chu")
    public String trangChu() {
        return "trang_chu";
    }

}

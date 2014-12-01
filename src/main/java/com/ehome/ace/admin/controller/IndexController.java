package com.ehome.ace.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by haoxiaolei on 2014/12/1 0001.
 */
@Controller
@RequestMapping("/index")
public class IndexController {

    @RequestMapping("")
    public String index() {
        return "index";
    }
}

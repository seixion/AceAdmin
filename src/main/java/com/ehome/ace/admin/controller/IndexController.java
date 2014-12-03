package com.ehome.ace.admin.controller;

import com.ehome.ace.admin.common.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by haoxiaolei on 2014/12/1 0001.
 */
@Controller
@RequestMapping(Constants.ADMIN)
public class IndexController {

    @RequestMapping("index")
    public String index() {
        return "index";
    }
}

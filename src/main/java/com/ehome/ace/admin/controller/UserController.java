package com.ehome.ace.admin.controller;

import jodd.util.RandomStringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by haoxiaolei on 2014/11/25 0025.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("view")
    public String view(Model model) {

        return "form_inline";
    }

    @RequestMapping("list")
    public Object list() {
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
        for (int i =1; i<=66;i++) {
            Map map = new HashMap();
            map.put("id", i);
            map.put("name", "测试用户：" + i);
            map.put("age", RandomStringUtil.randomNumeric(2));
            map.put("sex", "女");
            result.add(map);
        }

        return result;
    }
}

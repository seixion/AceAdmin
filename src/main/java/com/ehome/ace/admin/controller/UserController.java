package com.ehome.ace.admin.controller;

import jodd.util.RandomStringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("ajax")
    public String ajax() {
        return "datatables";
    }

    @RequestMapping("list")
    @ResponseBody
    public Object list() {
        Map<String, Object> result = new HashMap<String, Object>();
        List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
        for (int i = 1; i <= 66; i++) {
            Map map = new HashMap();
            map.put("id", i);
            map.put("name", "测试用户：" + i);
            map.put("age", RandomStringUtil.randomNumeric(2));
            map.put("sex", "女");
            data.add(map);
        }
        result.put("draw", 1);
        result.put("recordsTotal", 66);
        result.put("recordsFiltered", 66);
        result.put("data", data);

        return result;
    }







}

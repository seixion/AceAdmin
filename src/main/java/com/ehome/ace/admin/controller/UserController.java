package com.ehome.ace.admin.controller;

import com.ehome.ace.admin.common.Constants;
import jodd.util.RandomStringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by haoxiaolei on 2014/11/25 0025.
 */
@Controller
@RequestMapping(Constants.ADMIN + "/user")
public class UserController {

    @RequestMapping("view")
    public String view(Model model) {

        return "form_inline";
    }

    @RequestMapping("ajax")
    public String ajax() {
        return "user/user_list";
    }

    @RequestMapping("jqgrid")
    public String jqgrid() {
        return "jq_grid";
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
            map.put("birthday", new Date());
            map.put("enable", "1");
            map.put("sex", "1");
            data.add(map);
        }
        result.put("page", 1);
        result.put("total", 7);
        result.put("records", 66);
        result.put("rows", data);

        return result;
    }







}

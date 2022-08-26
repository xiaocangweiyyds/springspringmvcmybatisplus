package com.yr.controller;

import com.yr.entity.Account;
import com.yr.entity.Page;
import com.yr.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author heireng
 * @since 2021-12-03
 */
@Controller
//@RestController
public class AccountController {

    //lfjsdlkfjslkjfkldjflksjhfisdfsdfjsdjhfldfghslekjfliksdjflksejfkisajklrfhskfjkhrkjshfkjhfkjhfkshf
    
    @Autowired
    private IAccountService iAccountService;

    @RequestMapping(path = "/add", method = RequestMethod.POST)
    public void add(Account account) {
        iAccountService.add(account);
    }

    @RequestMapping(path = "/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        iAccountService.delete(id);
        return "redirect:/pages/account/list.jsp";
    }

    @ModelAttribute
    public void modelAttribute(@RequestParam(value = "id", required = false) Integer id, Model model) {
        if (id != null) {
            model.addAttribute("account", iAccountService.getQuery(id));
        }
    }

    @RequestMapping(path = "/update")
    public void update(@ModelAttribute("account") Account account) {
        iAccountService.update(account);
    }

    @ResponseBody
    @RequestMapping(path = "/getupdate")
    public Account getUpdate(int id) {
        return iAccountService.getQuery(id);
    }

    @ResponseBody
    @RequestMapping(path = "/query")
    public Page<Account> query(String pn) {
        int pageNo = 3; //每页显示的数据条数
        int pageNum = 0;    //当前页

        if (pn != null && pn != ""){
            pageNum = Integer.parseInt(pn);
        }

        int pageSize = iAccountService.selectCount(pageNo);

        if (pageNum < 1) {
            pageNum = 1;
        } else if (pageNum > pageSize) {
            pageNum = pageSize; // pageSize 总页数
        }

        List<Account> list = iAccountService.selectPage(pageNum, pageNo);

        Page<Account> page = new Page<>();
        page.setList(list);
        page.setPageNum(pageNum);
        page.setTotalPage(pageSize);

        return page;
    }

}


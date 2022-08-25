package com.yr.service.impl;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yr.entity.Account;
import com.yr.mapper.AccountMapper;
import com.yr.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author heireng
 * @since 2021-12-03
 */
@Service
public class AccountServiceImpl extends ServiceImpl<AccountMapper, Account> implements IAccountService {

    @Autowired
    private AccountMapper accountMapper;

    @Override
    public void add(Account account) {
        accountMapper.insert(account);
    }

    @Override
    public void delete(int id) {
        accountMapper.deleteById(id);
    }

    @Override
    public void update(Account account) {
        accountMapper.updateById(account);
    }

    @Override
    public Account getQuery(int id) {
        return accountMapper.selectById(id);
    }

    @Override
    public List<Account> selectPage(int current, int size) {
        Page<Account> page = new Page<>(current, size);//参数一是当前页，参数二是每页个数
        return accountMapper.selectPage(page, null).getRecords();
    }

    @Override
    public int selectCount(int pageNo) {
        int size = accountMapper.selectCount(null);
        int num = size / pageNo;
        if (size % pageNo != 0) { //没除断 就要多加1页
            num = num + 1;
        }
        return num;
    }


}

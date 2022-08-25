package com.yr.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yr.entity.Account;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author heireng
 * @since 2021-12-03
 */
public interface IAccountService extends IService<Account> {

    public void add(Account account);

    public void delete(int id);

    public void update(Account account);

    public Account getQuery(int id);

    public List<Account> selectPage(int current,int size);

    public int selectCount(int pageNo);

}

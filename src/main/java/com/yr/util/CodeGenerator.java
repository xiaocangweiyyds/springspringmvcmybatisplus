package com.yr.util;


import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableFill;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.VelocityTemplateEngine;

import java.util.ArrayList;
import java.util.List;

public class CodeGenerator {

    public static void main(String[] args) {
// 代码生成器
        AutoGenerator mpg = new AutoGenerator();
// 全局配置
        GlobalConfig gc = new GlobalConfig();
        final String projectPath = System.getProperty("user.dir");//当前工程路径
        gc.setOutputDir(projectPath + "/src/main/java");
        gc.setAuthor("heireng");//类注解
        gc.setBaseResultMap(true);
        gc.setBaseColumnList(true);

//        gc.setActiveRecord(true); 开启vr


// 是否打开输出目录 默认为true
        gc.setOpen(false);
        mpg.setGlobalConfig(gc);

// 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl("jdbc:mysql://localhost:3306/spring?characterEncoding=utf8&serverTimezone=UTC");
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("Aimer");
        mpg.setDataSource(dsc);

// 包配置
        final PackageConfig pc = new PackageConfig();
// pc.setModuleName(scanner("模块名"));
        pc.setParent("com.yr");
        mpg.setPackageInfo(pc);

// 自定义配置
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
// to do nothing
            }
        };

// 如果模板引擎是 freemarker
//        String templatePath = "/templates/mapper.xml.ftl";
// 如果模板引擎是 velocity
        String templatePath = "/templates/mapper.xml.vm";

// 自定义输出配置
        List<FileOutConfig> focList = new ArrayList<FileOutConfig>();
// 自定义配置会被优先输出
        focList.add(new FileOutConfig(templatePath) {
            @Override
            public String outputFile(TableInfo tableInfo) {
// 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                return projectPath + "/src/main/resources/mapper/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
            }
        });
        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);

// 配置模板
        TemplateConfig templateConfig = new TemplateConfig();
// 配置自定义输出模板
// 指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别
// templateConfig.setEntity("templates/entity2.java");
// templateConfig.setService();
// templateConfig.setController();
        templateConfig.setXml(null);
        mpg.setTemplate(templateConfig);

// 策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
// strategy.setSuperEntityClass("com.fame.common.BaseEntity");
        strategy.setEntityLombokModel(true);
        strategy.setRestControllerStyle(true);
// strategy.setSuperControllerClass("com.fame.common.BaseController");
        strategy.setInclude("account");
//        strategy.setSuperEntityColumns("id");
        strategy.setLogicDeleteFieldName("state");

        List<TableFill> tableFills = new ArrayList<>();
        TableFill creator = new TableFill("creator", FieldFill.INSERT);
        TableFill createTime = new TableFill("create_time", FieldFill.INSERT);
        TableFill updater = new TableFill("updater", FieldFill.UPDATE);
        TableFill updateTime = new TableFill("update_time", FieldFill.UPDATE);
        tableFills.add(creator);
        tableFills.add(createTime);
        tableFills.add(updater);
        tableFills.add(updateTime);

        strategy.setTableFillList(tableFills);

// strategy.setControllerMappingHyphenStyle(true);
        strategy.setTablePrefix("sys");
        mpg.setStrategy(strategy);
        mpg.setTemplateEngine(new VelocityTemplateEngine());
        mpg.execute();
    }
}

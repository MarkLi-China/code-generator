package codegen.gen;

import codegen.configxml.GenConfiguration;
import codegen.configxml.TableConfig;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.IOException;

/**
 * 详情页面生成类
 * @author xiongfang
 */
public class EditPageGen extends BaseGen {

    public EditPageGen(GenConfiguration genConfiguration, TableConfig tableConfig, Configuration ftlCfg) {

        super(genConfiguration, tableConfig, ftlCfg);
    }

    @Override
    public Template getTemplate() throws IOException {

        Template template = ftlCfg.getTemplate("detailPage.ftl");
        template.setEncoding("utf-8");
        return template;
    }

    @Override
    public void preGen() throws Exception {

    }

    @Override
    public String getOutPath() throws Exception {

        return genCfg.getBase().getJsp() + "/" + tableConfig.getTableMeta().getReferenceName() + "/detail.jsp";
    }

}

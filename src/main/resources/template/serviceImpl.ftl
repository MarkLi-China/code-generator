package ${cfg.base.service}.impl;

<#if table.page == true || table.list == true>
import java.util.List;
import java.util.Map;
import java.util.HashMap;
</#if>

import com.dhf.boss.param.PageBean;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.dhf.boss.service.AbstractService;
import ${cfg.base.service}.${table.tableMeta.entityName}Service;
import ${cfg.base.mapperExt}.${table.tableMeta.entityName}Dao;
import ${cfg.base.param}.${table.tableMeta.entityName}Param;
import ${cfg.base.mapperModel}.${table.tableMeta.entityName};

/**
* ${table.tableMeta.entityName}Service.java
* @version 1.0.0
*/
@Service("${table.tableMeta.referenceName}")
public class ${table.tableMeta.entityName}ServiceImpl extends AbstractService implements ${table.tableMeta.entityName}Service {

@Autowired
private ${table.tableMeta.entityName}Dao ${table.tableMeta.referenceName}Dao;

/**
* 新增
*/
@Override
public int save(${table.tableMeta.entityName} ${table.tableMeta.referenceName}) {
return ${table.tableMeta.referenceName}Dao.insertSelective(${table.tableMeta.referenceName});
}

/**
* 修改
*/
@Override
public int update(${table.tableMeta.entityName} ${table.tableMeta.referenceName}) {
return ${table.tableMeta.referenceName}Dao.updateByPrimaryKeySelective(${table.tableMeta.referenceName});
}

/**
* 删除
*/
@Override
public int delete(Integer id) {
return ${table.tableMeta.referenceName}Dao.deleteByPrimaryKey(id);
}

/**
* 根据id查询
*/
@Override
public ${table.tableMeta.entityName} get${table.tableMeta.entityName}(Integer id) {
return ${table.tableMeta.referenceName}Dao.selectByPrimaryKey(id);
}

<#if table.page == true>
/**
* 分页查询
*/
@Override
public List<${table.tableMeta.entityName}> getListByPage(PageBean pageBean, ${table.tableMeta.entityName}Param param) {

Map
<String, Object> params = new HashMap
<String, Object>();
params.put("params", param);

int count = ${table.tableMeta.referenceName}Dao.count(params);
pageBean.setTotalSize(count);

params.put("pager", pageBean);

return ${table.tableMeta.referenceName}Dao.getListByPage(params);
}

</#if>
<#if table.list == true>
/**
* 查询所有
*/
@Override
public List<${table.tableMeta.entityName}> getList(${table.tableMeta.entityName}Param param) {
Map
<String, Object> params = new HashMap
<String, Object>();
params.put("params", param);
return ${table.tableMeta.referenceName}Dao.getList(params);
}
</#if>

}
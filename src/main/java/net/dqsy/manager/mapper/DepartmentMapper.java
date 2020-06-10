package net.dqsy.manager.mapper;


import net.dqsy.manager.pojo.Department;
import net.dqsy.manager.pojo.Organization;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentMapper {

    List<Department> findList(@Param("orgId") long orgId, @Param("start") int start, @Param("limit") int limit);

    void add(@Param("department") Department department);

    int getTotalCount(@Param("orgId") long orgId);

    Department findDepartmentById(@Param("departmentId") Long departmentId);

    void deleteById(@Param("departmentId") Long departmentId);
    
    void updateDepartment(@Param("departmentId") Long departmentId);

}

package com.tea.web.common;

import java.lang.annotation.*;


@Inherited // 指定被修饰的Annotation将具有继承性
@Documented //指定被修饰的该Annotation可以被javadoc工具提取成文档
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface MyLog {
    
}

package com.tea.web.common;


import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
//类不被识别，将类变成一个组件
@Component
@Slf4j
public class LogAop {
    //    指定切入的规则,".."代表可有参可无参
    @Pointcut("@annotation(com.tea.web.common.MyLog)")
    public  void logger(){}

    //    环绕通知
    @Around("logger()")
    public Object around(ProceedingJoinPoint point){
        //        获得方法名称
        Signature methodName=point.getSignature();

//        日志输出
        log.info(methodName+"进来了，参数："+point.getArgs());
        Long l1=System.currentTimeMillis();
//        让方法执行
        Object obj=null;
        try {
            obj=point.proceed(point.getArgs());
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        log.info(methodName+"走了"+"\t耗时"+(System.currentTimeMillis()-l1));
        return obj;

    }

}

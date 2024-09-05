package com.tea.web.common;

import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;

public class queue {

    private static final Queue<Map> queue =new LinkedList<>();

    /**
     * 取号队列
     * @param map
     * @return
     */
    public static boolean add(Map<String, Object> map){
        return queue.offer(map);
    }

    /**
     * 叫号队列
     *
     * @return
     */
    public static Map take(){
        return queue.poll();
    }
}

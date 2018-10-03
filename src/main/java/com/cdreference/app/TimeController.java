package com.cdreference.app;

import java.time.LocalTime;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/time")
@Slf4j
public class TimeController {

    @RequestMapping("")
    @ResponseBody
    public VersionedTime time() {
        VersionedTime response = new VersionedTime();
        response.setTime((LocalTime.now()).toString());
        return response;
    }

    @RequestMapping("slow")
    @ResponseBody
    public String slowTime() {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            log.error("Delay interrupted", e);
        }
        return (LocalTime.now()).toString();
    }

}

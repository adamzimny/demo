package com.cdreference.app;

import lombok.Data;

@Data
public class VersionedTime {

    private String time;
    private String version = "6.0";

}

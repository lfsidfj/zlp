package com.szjm.entity.zlp;

import java.io.Serializable;

public class Brand implements Serializable {
    private String BRAND_ID;
    private String BRAND_NAME;
    private String BRAND_URL;
    private int SEQENCE;

    public String getBRAND_ID() {
        return BRAND_ID;
    }

    public void setBRAND_ID(String BRAND_ID) {
        this.BRAND_ID = BRAND_ID;
    }

    public String getBRAND_NAME() {
        return BRAND_NAME;
    }

    public void setBRAND_NAME(String BRAND_NAME) {
        this.BRAND_NAME = BRAND_NAME;
    }

    public String getBRAND_URL() {
        return BRAND_URL;
    }

    public void setBRAND_URL(String BRAND_URL) {
        this.BRAND_URL = BRAND_URL;
    }

    public int getSEQENCE() {
        return SEQENCE;
    }

    public void setSEQENCE(int SEQENCE) {
        this.SEQENCE = SEQENCE;
    }
}

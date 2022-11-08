package com.jugameza.unBook.models;

import lombok.*;


public class ResponseModel {

    @Getter @Setter
    private String result;

    @Getter @Setter
    private String error;

    public ResponseModel(String result, String error) {
        this.result = result;
        this.error = error;
    }
}

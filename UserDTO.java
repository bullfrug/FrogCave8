package com.codingrecipe.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {

    private Long id; // bigint -> Long
    private String email; // varchar(50) -> String
    private String password; // varchar(20) -> String
    private String name; // varchar(50) -> String
    private Long phoneNumber; // bigint -> Long

}
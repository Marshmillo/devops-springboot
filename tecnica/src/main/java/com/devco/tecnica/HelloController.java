package com.devco.tecnica;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @RequestMapping(value = "/hello/{name}",
            method = RequestMethod.GET)
    public String getHello(
            @PathVariable("name") String name
    ) {
        return "Hola " + name;
    }
}

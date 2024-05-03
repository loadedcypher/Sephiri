package com.buza.sephiri;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;
import java.util.HashMap;

@RestController
public class MyController {

    // API endpoint to encrypt a string.
    @GetMapping("/api/encryptString")
    public String encryptString(@RequestParam String text, @RequestParam int key) {
        return Secure.encrypt(text, key);
    }

    // API endpoint to decrypt a string.
    @GetMapping("/api/decryptString")
    public String decryptString(@RequestParam String encryptedText, @RequestParam int key) {
        return Secure.decrypt(encryptedText, key);
    }
    //API endpoint to decrypt an encrypted text given a filename.

    @GetMapping("/api/analyse")
    public Map<Character,Integer> frequencyAnalysis(@RequestParam String filename) {
        Map<Character,Integer> analysis = new HashMap<>();

        try {
            analysis = Secure.analyse(filename);
            
        } catch (Exception e) {
            System.out.println(e);
        }

        return analysis;
    }

}


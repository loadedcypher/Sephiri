package com.buza.sephiri;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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

    //API endpoint to read the contents of a file given a filename as a parameter.
    @GetMapping("/api/readFile")
    public String readFile(@RequestParam String fileName) {
        return Secure.readFile(fileName);
    }

    //API endpoint to read the contents of a file given a filename as a parameter.
    @GetMapping("/api/writeFile")
    public void writeFile(@RequestParam String fileName, @RequestParam String location, @RequestParam String fileContents) {
        Secure.writeFile(fileName, location,  fileContents);
    }

    // API endpoint to just encrypt a file's contents given a key

    @GetMapping("/api/encryptFile")
    public String encryptFile(@RequestParam String fileName, @RequestParam int key) {
        return Secure.encryptFile(fileName, key);
    }

    @GetMapping("/api/decryptFile")
    public String decryptFile(@RequestParam String fileName, @RequestParam int key) {
        return Secure.decryptFile(fileName, key);
    }


}


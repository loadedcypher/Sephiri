package com.buza.sephiri;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Secure {

    // A method to encrypt the message.

    public static String encrypt(String msg, int key) {
        // a list to keep track of the converted characters.
        ArrayList<Character> encryptedCharacters = new ArrayList<>();

        // a string builder to host the final encrypted string.
        StringBuilder encryptedString = new StringBuilder();

        // Iterate through every character in the string
        for (char character : msg.toCharArray()) {

            // get the ascii value of the character
            int asciiValue = (int) character;

            // add the key to the value
            asciiValue = asciiValue + key;

            // convert the new ascii value back into a character
            character = (char) asciiValue;

            encryptedCharacters.add(character);
        }

        // append every encrypted character into the stringBuider
        for(Character ch: encryptedCharacters){
            encryptedString.append(ch);
        }

        return encryptedString.toString();
    }

    // A method to decrypt the message.

    public static String decrypt(String msg, int key) {
        // a list to keep track of the converted characters.
        ArrayList<Character> decryptedCharacters = new ArrayList<>();

        // a string builder to host the final encrypted string.
        StringBuilder decryptedString = new StringBuilder();

        // Iterate through every character in the string
        for (char character : msg.toCharArray()) {

            // get the ascii value of the character
            int asciiValue = (int) character;

            // add the key to the value
            asciiValue = asciiValue - key;

            // convert the new ascii value back into a character
            character = (char) asciiValue;

            decryptedCharacters.add(character);
        }

        // append every encrypted character into the stringBuider
        for(Character ch: decryptedCharacters){
            decryptedString.append(ch);
        }

        return decryptedString.toString();
    }

    // method read contents of a file and return them as a string.

    public static String readFile(String fileName) {
        StringBuffer contents = new StringBuffer();
        try(BufferedReader br = new BufferedReader(new FileReader(fileName));) {
            String line;

            // each time a line is read it gets encrypted.
            while ((line = br.readLine()) != null) {
                contents.append(line);
            }
            br.close();
        }
        catch(IOException e) {
            System.out.println(e);
        }

        return contents.toString();

    }


    // A method to decrypt a file using frequency analysis.

    public static Map<Character, Integer> analyse(String filename) throws IOException {
        // A map to store characters in the file and their frequencies
        Map<Character, Integer> frequencies = new HashMap<>();
        String cipherString = readFile(filename);
        StringBuffer decryptedText = new StringBuffer();
    

        // Remove non-alphabetical characters and convert uppercase letters to lowercase
        String formattedText = cipherString.toString().replaceAll("[^a-zA-Z]", "").toLowerCase();
        // Count the frequency of each letter and store them
        for (char c : formattedText.toCharArray()) {
            frequencies.put(c, frequencies.getOrDefault(c, 0) + 1);
        }


        /*
         * I TRIED PERFORMING ACTUAL DECRYPTION OF THE STRING USING FREQUENCY ANALYSIS INSTEAD OF JUST RETURNING A MAP,
         * KE PALETSWE
         */
    
        // A list of the most frequently used letters in English
        String englishFreq = "etaoinshrdlcumwfgypbvkjxqz";
        // A map to store the most frequent alphabet in the English language and the cipher text
        Map<Character, Character> mapping = new HashMap<>();
        int i = 0;
        for (char c : frequencies.keySet()) {
            if (i >= englishFreq.length()) {
                break;
            }
            mapping.put(c, englishFreq.charAt(i));
            i++;
        }
    
        // Decrypt the cipher text
        for (char c : cipherString.toString().toCharArray()) {
            char decryptedChar = mapping.getOrDefault(Character.toLowerCase(c), c);
            if (Character.isUpperCase(c)) {
                decryptedChar = Character.toUpperCase(decryptedChar);
            }
            decryptedText.append(decryptedChar);
        }
        
        return frequencies;
    }
}


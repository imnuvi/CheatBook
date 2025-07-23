

### All commands and tricks related to ubuntu.



#### Keyring

With recent releases in ubuntu the apt-key package has been depracated. To counter this we will need to manually manage keys or use a different keyring maintainer.

To understand what a keyring is, it is simply a secrets manager ( like a password manager. ) We also need to know what gpg keys are

GPG key - here the GPG stands for GnuPG. a GnuPG key is a set of public and private key pair that is used just like a key pair.
    Basically how this works is, an entity ( can be a server a human or anything on the internet ) provides a public key to the rest of the world and has a private key stored somewhere safe.
    Now whenever any sort of communication happens, The public key is used to encrypt stuff, and only the original owner of the key can decrypt it properly. THis means they can verify the 
    authenticity of the person without the need for explicit password. Basically, the authentication is contained within the message. ( smart )


Now Why is this required for linux systems and why are they used with packages?
    When we download stuff from the internet we have to be very sure of the package we are downloading and we will have to verify it's authenticity. 
    This is achieved by using the key mechanism, where we have a key and then verify if the file really is from the original source and is free of malware.


Now apt-key used to do this automatically and saves this stuff in a directory - /etc/apt/trusted.gpg.d
But this directory is not the most secure and other people can check and access this info.

So the ideal solution is to store all these keys under /etc/apt/keyrings



Links: 

- https://www.reddit.com/r/GnuPG/comments/uq8bq7/please_explain_like_im_5_years_old_what_is_a_gpg/
- https://stackoverflow.com/questions/68992799/warning-apt-key-is-deprecated-manage-keyring-files-in-trusted-gpg-d-instead

# Groxio OTP course
Groxio training

## 1 Install these tools, plus Elixir

The tools you will need to install: 

- zoom 
- git (https://git-scm.com/downloads). 
- an editor that you are comfortable with. 

You will also need a camera that works with Zoom. We will keep our cameras on throughout the class to improve communication and engagement. 

For the development dependencies, you'll need: 

- Elixir 1.14, with OTP 25. Make sure it's working: 

run the command: 

```
[otp_dec] ➔ elixir -v
Erlang/OTP 25 [erts-13.1.3] [source] [64-bit] [smp:10:10] [ds:10:10:10] [async-threads:1] [jit]

Elixir 1.14.2 (compiled with Erlang/OTP 25)

```

Verify that observer is working (helpful but optional):

```
[otp_dec] -> iex
iex(1)> :observer.start
```

You will see a window come up and the `:ok` return code. Don't save this for the last minute! It's a hands on class, and you need time to work out any bugs you might encounter. 


## 2. Clone this repository

1. Fork this repository to your github account. 

- Go to https://github.com/groxio-learning/otp_dec
- Click the `fork` button in the upper right corner
- Navigate to *your local version* (at something like git@github.com:your-github-user/otp_dec.git. )
- Copy the clone address to your clipboard. Click the bright green `code` button, then click the copy-to-clipboard button on the `clone` page.

2. Clone your local version to your local machine. 

- Clone it. *REPLACE your-github-account with your github account name*:  

```
>  git clone <paste the url>
...clones repo...
cd otp_dec
```

- Verify your remote: 

```
$ git remote -v
> origin  https://github.com/your-user/otp_dec.git (fetch)
> origin  https://github.com/your-user/otp_dec.git (push)
```

- If there's no origin, set it. Make sure you *replace your-github-user*:

```
otp_dec> git remote add origin https://github.com/your-github-user/otp_dec.git
```

- Verify your remote: 

```
$ git remote -v
> origin  https://github.com/your-user/otp_dec.git (fetch)
> origin  https://github.com/your-user/otp_dec.git (push)
```

- Set the upstream to the Groxio repo:

```
otp_dec> git remote add upstream https://github.com/groxio-learning/otp_dec.git
```

- Verify the remotes: 

```
> origin  https://github.com/your-user/otp_dec.git (fetch)
> origin  https://github.com/your-user/otp_dec.git (push)
> upstream  https://github.com/groxio-learning/otp_dec.git (fetch)
> upstream  https://github.com/groxio-learning/otp_dec.git (push)
```

3. Now check out your setup. Send me a pull request: Edit the file "pull_requests.md" and add your name: 

- git pull upstream main
- Edit pull_requests.md

```
- Bruce Tate
- Your Name Here
```

- Commit the file and push

```
> git commit . -m "my commit"

...some happy success message...

> git push origin main

...some happy success message...
```

Now go to your repo online. Click: "Compare and create pull request" 

Your homework is done!

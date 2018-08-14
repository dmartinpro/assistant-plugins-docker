Build Docker container using command

```
docker build -t assistant-freebox .

```

Then run it using env variable to set up Pushbullet token and Freebox remote control code:

```
docker run -d \
      -t \
      --name assistant-freebox \
      -e "TZ=Europe/Paris" \
      -e PB_TOKEN=o.ZVO9aaaaaaaaabbbbbbbbcccccccddddd \
      -e RC_CODE=12345678 \
      --restart=unless-stopped \
      assistant-freebox:latest
```

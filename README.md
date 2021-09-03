# Ghost Over Tor On Heroku

Ghost is a free, open, simple blogging platform. Visit the project's website at <http://ghost.org>, or read the docs on <http://support.ghost.org>.

## Deploying on Heroku

To get your own Ghost blog running on Heroku, click the button below:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/sumithemmadi/ghost-over-tor-on-heroku)


### Things you should know

- After deployment, visit the admin area at `YOURAPPNAME.herokuapp.com/ghost` to set up your blog.

- Now your blog will be accessible at `YOURAPPNAME.herokuapp.com`.

### What do I put in the deployment and environment variable fields?

- **App name (required)**. Pick a name for your application. Heroku says this field is optional, but it’s easier if you choose a name here, because you need to specify the URL of your blog in the first config field anyway. You can add a onion domain later if you want, but this is the name of the application you’ll see in your Heroku dashboard.

- **Heroku URL (required)**. Take the name of your Heroku application, and put it into URL form. For example, if you choose `my-ghost-blog` as the app name, the Heroku URL config value needs to be `http://my-ghost-blog.herokuapp.com` (no trailing slash). If you subsequently set up a [custom domain](https://devcenter.heroku.com/articles/custom-domains) for your blog, you’ll need to update your Ghost blog’s `HEROKU_URL` environment variable accordingly.

#### Using with file uploads disabled

Heroku app filesystems [aren’t meant for permanent storage](https://devcenter.heroku.com/articles/dynos#ephemeral-filesystem), so file uploads are disabled by default when using this repository to deploy a Ghost blog to Heroku. If you’re using Ghost on Heroku with S3 file uploads disabled, you should leave all environment variables beginning with `S3_…` blank.

#### Configuring S3 file uploads

To configure S3 file storage, create an S3 bucket on Amazon AWS, and then specify the following details as environment variables on the Heroku deployment page (or add these environment variables to your app after deployment via the Heroku dashboard):

- `S3_ACCESS_KEY_ID` and `S3_ACCESS_SECRET_KEY`: **Required if using S3 uploads**. These fields are the AWS key/secret pair needed to authenticate with Amazon S3. You must have granted this keypair sufficient permissions on the S3 bucket in question in order for S3 uploads to work.

- `S3_BUCKET_NAME`: **Required if using S3 uploads**. This is the name you gave to your S3 bucket.

- `S3_BUCKET_REGION`: **Required if using S3 uploads**. Specify the region the bucket has been created in, using slug format (e.g. `us-east-1`, `eu-west-1`). A full list of S3 regions is [available here](http://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region).

- `S3_ASSET_HOST`: Optional, even if using S3 uploads. Use this variable to specify the S3 bucket URL in virtual host style, path style or using a custom domain. See [this page](http://docs.aws.amazon.com/AmazonS3/latest/dev/VirtualHosting.html) for details.

Once your app is up and running with these variables in place, you should be able to upload images via the Ghost interface and they’ll be stored in Amazon S3. :sparkles:
<!--
### How this works

This repository is essentially a minimal web application that specifies [Ghost as a dependency](https://github.com/TryGhost/Ghost/wiki/Using-Ghost-as-an-NPM-module), and makes a deploy button available.

-->
## Set Tor Hidden Service

To set your Hidden Service,clone your application  with below commands on your computer.

```
heroku git:clone --app YOUR_APP_NAME && cd YOUR_APP_NAME
```
This command will  show warning<br>  
warning: You appear to have cloned an empty repository.

Run below commands.


```
git remote add origin https://github.com/sumithemmadi/ghost-over-tor-on-heroku
git pull origin main
```

This will pull down the code that was deployed to Heroku so you have it locally on your computer.

Copy the following files to `temp/var/lib/tor/hidden_service` dir<br> 

   - `hostname`
   - `hs_ed25519_public_key`
   - `hs_ed25519_secret_key`

  > If you don't know where these files stored refer to **[https://2019.www.torproject.org/docs/tor-onion-service](https://2019.www.torproject.org/docs/tor-onion-service)**
  
Now set ONION URL as URL of your blog. here YOUR_ONION_DOMAIN is contents of `hostname`.

```
heroku config:set HEROKU=http://YOUR_ONION_DOMAIN
```
Now deploy app by pushing the changes to heroku.
```
git add .
git commit -am "Ghost Over Tor On Heroku"
git push heroku master
```

Now you ghost blog is accessible over tor.

## Problems?

If you have problems using your instance of Ghost, you should check the [official documentation](http://support.ghost.org/) or open an issue on [the official issue tracker](https://github.com/TryGhost/Ghost/issues). If you discover an issue with the deployment process provided by *this repository*, then [open an issue here](https://github.com/sumithemmadi/ghost-over-tor-on-heroku).



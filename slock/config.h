/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#282828",     /* after initialization */
	[INPUT] =  "#504945",   /* during input */
	[FAILED] = "#1d2021",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;

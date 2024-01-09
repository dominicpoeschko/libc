#ifndef __LOCALE_H_
#define __LOCALE_H_

#ifdef __cplusplus
extern "C" {
#endif

// TODO: documnentation

#define LC_COLLATE_MASK         1
#define LC_CTYPE_MASK           2
#define LC_MESSAGES_MASK        4
#define LC_MONETARY_MASK        8
#define LC_NUMERIC_MASK         16
#define LC_TIME_MASK            32
#define LC_ALL_MASK             (LC_COLLATE_MASK | LC_CTYPE_MASK | \
                                 LC_MESSAGES_MASK | LC_MONETARY_MASK |\
                                 LC_NUMERIC_MASK | LC_TIME_MASK)

struct lconv
{
	char* decimal_point;
	char* thousands_sep;
	char* grouping;

	char* int_curr_symbol;
	char* currency_symbol;
	char* mon_decimal_point;
	char* mon_thousands_sep;
	char* mon_grouping;
	char* positive_sign;
	char* negative_sign;
	char int_frac_digits;
	char frac_digits;
	char p_cs_precedes;
	char p_sep_by_space;
	char n_cs_precedes;
	char n_sep_by_space;
	char p_sign_posn;
	char n_sign_posn;
	char int_p_cs_precedes;
	char int_p_sep_by_space;
	char int_n_cs_precedes;
	char int_n_sep_by_space;
	char int_p_sign_posn;
	char int_n_sign_posn;
};

typedef int locale_t;

#ifndef DISABLE_UNIMPLEMENTED_LIBC_APIS
char* setlocale(int, const char*);
struct lconv* localeconv(void);
locale_t uselocale(locale_t);
int isxdigit_l(int c, locale_t locale);
int isdigit_l(int c, locale_t locale);
int strcoll_l(const char *__s1, const char *__s2, locale_t locale);
unsigned long long strtoull_l(const char *__nptr, char **__endptr,
    int __base, locale_t locale);
long long strtoll_l(const char *__nptr, char **__endptr,
    int __base, locale_t locale);
double
strtod_l(const char * nptr, char ** endptr, locale_t locale);

float
strtof_l(const char *  nptr, char ** endptr, locale_t locale);

long double
strtold_l(const char * nptr, char ** endptr, locale_t locale);
#endif


#ifdef __cplusplus
}
#endif

#endif // __LOCALE_H_

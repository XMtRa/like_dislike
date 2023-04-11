#### Preregistered

```{r}
fit_brms_hrdl_prereg <- 
  brm(
    bf(
      COMM ~ 
        1 + 
        pri_con_fs + 
        grats_spec_fs + 
        pri_del_fs + 
        trust_gen_fs +
        self_eff_fs +
        age + 
        male + 
        edu, 
      hu ~ 
        1 + 
        pri_con_fs + 
        grats_spec_fs + 
        pri_del_fs + 
        trust_gen_fs +
        self_eff_fs +
        age + 
        male + 
        edu
    ), 
    data = d, 
    family = hurdle_gamma()
  )

```


```{r}
plot(fit_brms_hrdl_prereg, ask = FALSE)
```

```{r}
model_diagnostics(fit_brms_hrdl_prereg)
```

```{r}
summary(fit_brms_hrdl_prereg)
```

```{r}
conditional_effects(fit_brms_hrdl_prereg, ask = FALSE)
```

#### Adapted

```{r}
fit_brms_hrdl_adapted <- 
  brm(
    bf(
      COMM ~ 
        1 + 
        pri_con_fs + 
        grats_spec_fs + 
        pri_del_fs + 
        self_eff_fs +
        age + 
        male + 
        edu, 
      hu ~ 
        1 + 
        pri_con_fs + 
        grats_spec_fs + 
        pri_del_fs + 
        self_eff_fs +
        age + 
        male + 
        edu
    ), 
    data = d, 
    family = hurdle_gamma()
  )

```


```{r}
plot(fit_brms_hrdl_adapted, ask = FALSE)
```

```{r}
model_diagnostics(fit_brms_hrdl_adapted)
```

```{r}
summary(fit_brms_hrdl_adapted)
```

```{r}
conditional_effects(fit_brms_hrdl_adapted, ask = FALSE)
```

#### 3-way Interaction

```{r}
fit_brms_hrdl_inter <- 
  brm(
    bf(
      COMM ~ 
        1 + 
        pri_con_fs_c * 
        grats_spec_fs_c * 
        pri_del_fs_c + 
        self_eff_fs_c +
        age_c + 
        male_c + 
        edu_c, 
      hu ~ 
        1 + 
        pri_con_fs_c * 
        grats_spec_fs_c * 
        pri_del_fs_c + 
        self_eff_fs_c +
        age_c + 
        male_c + 
        edu_c
    ), 
    data = d, 
    family = hurdle_gamma()
  )

```


```{r}
plot(fit_brms_hrdl_inter, ask = FALSE)
```

```{r}
model_diagnostics(fit_brms_hrdl_inter)
```

```{r}
summary(fit_brms_hrdl_inter)
```

```{r}
conditional_effects(fit_brms_hrdl_inter, ask = FALSE)
```

#### Simple hurdle model

```{r}
fit_brms_simple_hurdle <- 
  brm(
    bf(
      COMM ~ 
        1 + 
        pri_con_fs + 
        grats_spec_fs + 
        age + 
        male + 
        edu, 
      hu ~ 
        1 + 
        pri_con_fs + 
        grats_spec_fs + 
        age + 
        male + 
        edu
    ), 
    data = d, 
    family = hurdle_gamma()
  )
```


```{r}
plot(fit_brms_simple_hurdle, ask = FALSE)
```

```{r}
model_diagnostics(fit_brms_simple_hurdle)
```

```{r}
summary(fit_brms_simple_hurdle)
```

```{r}
conditional_effects(fit_brms_simple_hurdle, ask = FALSE)
```

#### Interaction model

#### Simple hurdle model

```{r}
fit_brms_hurdle_inter <- 
  brm(
    bf(
      COMM ~ 
        1 + 
        pri_con_fs_c * 
        grats_spec_fs_c *
        pri_del_fs_c +
        age + 
        male + 
        edu, 
      hu ~ 
        pri_con_fs_c * 
        grats_spec_fs_c *
        pri_del_fs_c +
        age + 
        male + 
        edu
    ), 
    data = d, 
    family = hurdle_gamma()
  )
```


```{r}
plot(fit_brms_hurdle_inter, ask = FALSE)
```

```{r}
model_diagnostics(fit_brms_hurdle_inter)
```

```{r}
summary(fit_brms_hurdle_inter)
```

```{r}
conditional_effects(fit_brms_hurdle_inter, ask = FALSE)
```

#### Interaction model including deliberation

```{r}
fit_brms <- brm(COMM ~ pri_con_fs_c * grats_spec_fs_c + pri_con_fs_c * pri_del_fs_c + grats_spec_fs_c * pri_del_fs_c + age + male + edu, data = d, family = zero_inflated_poisson())
summary(fit_brms)
```

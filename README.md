# MOP_MD2_TESTS
Testus palaiž ar
```
make test
```
 bet var palaist arī atsevišķi
```
make test_empty
make test_bad_data
make test_good_data
make test_big_matrice
```
Lai testi strādātu vajag izvadīt rezultātu kā norādīts iekš md2_main.c:
```
printf("%d %d ", h1, w2);
for (int i = 0; i < h1*w2; i++) {
    printf("%d ", m3[i]);
}
printf("\n");
```

Var arī saģenerēt matricas ar matrgen.cpp. (pievienoja: Andis)
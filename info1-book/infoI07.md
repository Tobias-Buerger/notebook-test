---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.13.8
kernelspec:
  display_name: Python 3 (ipykernel)
  language: python
  name: python3
---


# 7. Entwurf von Schleifen, While-Schleifen, Hilfsfunktionen und Akkumulatoren
## 1 Entwurf von Schleifen
### Rechnen mit Polynomen
#### Definition
Ein Polynom vom Grad n ist eine Folge von Zahlen $(a_0,a_1,...,a_n)$, den Koeffizienten. Dabei ist $\textcolor{red}{n \ge 0}$  und $\textcolor{red}{a_n \neq 0}$.

#### Beispiele
- ()
- (1)
- (3,2,1)

#### Anwendungen
Kryptographie, fehlerkorrigierende Codes

#### Rechenoperationen auf Polynomen
- (Skalar) Multiplikation mit einer Zahl c 
$ c \cdot (a_0,a_1,...,a_n) = (c \cdot a_0, c \cdot a_1,...,c \cdot a_n) $
- Auswertung an einer Stelle $x_0$ 
$ (a_0,a_1,...,a_n)[x_0] = \sum_{i=0}^n a_i \cdot x_0^i $
- Ableitung 
$ (a_0,a_1,...,a_n)' = (1 \cdot a_0, 2 \cdot a_1,..., n \cdot a_n)$
- Integration 
$ \int (a_0,a_1,...,a_n) = (0,a_0,a_1/2,a_2/3...,a_n/(n+1)) $

### Skalarmultiplikation
$ c \cdot (a_0,a_1,...,a_n) = (c \cdot a_0, c \cdot a_1,...,c \cdot a_n) $
#### Schritt 1: Bezeichner und Datentypen
Die Funktion $\textcolor{red}{skalar\_mult}$ nimmt als Eingabe
  - $\textcolor{red}{c: complex}$, den Faktor,
  - $\textcolor{red}{p: list[complex]}$, ein Polynom.
Der Grad des Polynoms ergibt sich aus der Länge der Sequenz.

#### Schritt 2: Funktionsgerüst
```{code-cell} ipython3
  def skalar_mult(c: complex, p: list[complex])-> list[complex]:
    # fill in, initialization
    for a in p:
        pass # fill in action for each element
    return 
```

#### Schritt 3: Beispiele
Es soll
  - skalar_mult(42,[]) == []
  - skalar_mult(42, [1,2,3]) == [42,84,126]
  - skalar_mult(-0.1, [1,2,3]) == [-0.1,-0.2,-0.3]
sein. 

Daraus wird dann die Funktionsdefinition erarbeitet.

#### Schritt 4: Funktionsdefinition
```{code-cell} ipython3
  def skalar_mult(c: complex, p: list[complex])-> list[complex]:
    result = []
    for a in p:
        result = result + [c * a]
    return result
```

#### Schritt 5: Testen
```{code-cell} ipython3
  :tags: ["raises-exception"]
  assert skalar_mult(42,[]) == [] 
  assert skalar_mult(42, [1,2,3]) == [42,84,126] 
  assert skalar_mult(-0.1, [1,2,3]) == [-0.1,-0.2,-0.3]  
```

> $\textbf{Muster: }$ Akkumulator
##### Rumpf der Skalarmultiplikation

    for a in p:
      result = result + [c * a]
    return result

Variable result ist Akkumulator
  - In result wird das Ergebnis aufgesammelt (akkumuliert)
  - result wird vor der Schleife initialisiert auf das Ergebnis für die leere Liste
  - Jeder Schleifendruchlauf erweitert das Ergebnis in result, indem das Ergebnis mit dem aktuellen Element a erweitert wird.

### Auswertung
$ (a_0,a_1,...,a_n)[x_0] = \sum_{i=0}^n a_i \cdot x_0^i $
#### Schritt 1: Bezeichner und Datentypen
Die Funktion $\textcolor{red}{poly\_eval}$ nimmt als Eingabe
  - $\textcolor{red}{p: list[complex]}$, ein Polynom,
  - $\textcolor{red}{x: complex}$, das Argument.

Der Grad des Polynoms ergibt sich aus der Länge der Sequenz.

#### Schritt 2: Funktionsgerüst
```{code-cell} ipython3
  def poly_eval(p: list[complex], x: complex)-> complex:
    result = []
    for a in p:
        pass
    return 
```

#### Schritt 3: Beispiele
Es soll gelten:
  - poly_eval([], 2) == 0
  - poly_eval([1,2,3], 2) == 17
  - poly_eval([1,2,3], -0.1) == 0.83

#### Schritt 4: Funktionsdefinition
```{code-cell} ipython3
  def poly_eval(p: list[complex], x: complex)-> complex:
    result = 0
    i = 0
    for a in p:
        result = result + a * x ** i
        i = i + 1
    return result
```

#### Schritt 4: Alternative Funktionsdefinition
```{code-cell} ipython3
  def poly_eval(p: list[complex], x: complex)-> complex:
    result = 0
    for i, a in enumerate(p): # <<---
        result = result + a * x ** i
    return result
```
- enumerate(seq) liefert Paare aus (Laufindex, Element)
- Beispiel list(enumerate([8,8,8])) == [(0,8), (1,8), (2,8)]

#### Schritt 5: Testen
```{code-cell} ipython3
  :tags: ["raises-exception"]
  assert poly_eval([], 2) == 0 
  assert poly_eval([1, 2, 3], 2) == 17 
  assert poly_eval([1,2,3], -0.1) == 0.83 
```

### Ableitung
$ (a_0,a_1,...,a_n)' = (1 \cdot a_0, 2 \cdot a_1,..., n \cdot a_n)$

#### Schritt 1: Bezeichner und Datentypen
Die Funktion $\textcolor{red}{derivative}$ nimmt als Eingabe
  - $\textcolor{red}{p: list[complex]}$, ein Polynom.

Der Grad des Polynoms ergibt sich aus der Länge der Sequenz.

#### Schritt 2: Funktionsgerüst
```{code-cell} ipython3
  def derivative(p: list[complex]) -> list[complex]:
    #initialization
    for a in p:
      pass # fill in action for each element
    return
```

#### Schritt 3: Beispiele
Es soll gelten:
  - derivative([]) == []
  - derivative([42]) == []
  - derivative([1,2,3]) == [2,6]

#### Schritt 4: Funktionsdefinition
```{code-cell} ipython3
  def derivative(p: list[complex]) -> list[complex]:
    result = []
    for i, a in enumerate(p):
      if i > 0:
        result = result + [i * a]
    return result
```

#### Schritt 5: Testen
```{code-cell} ipython3
  :tags: ["raises-exception"]
  assert derivative([]) == [] 
  assert derivative([42]) == []
  assert derivative([1,2,3]) == [2,6] 
```

### Integration
$ \int (a_0,a_1,...,a_n) = (0,a_0,a_1/2,a_2/3...,a_n/(n+1)) $

#### Schritt 1: Bezeichner und Datentypen
Die Funktion $\textcolor{red}{integral}$ nimmt als Eingabe
  - $\textcolor{red}{p: list[complex]}$, ein Polynom.

Der Grad des Polynoms ergibt sich aus der Länge der Sequenz.

#### Weitere Schritte
selbst

### Operationen mit zwei Polynomen
  - Addition (falls $n \le m$)
  $(a_0,a_1,...,a_n) + (b_0,b_1,...,b_m) = (a_0+b_0,a_1+b_1,...,a_n+b_n,b_{n+1},...,b_m)$
  - Multiplikation von Polynomen
  $(a_0,a_1,...,a_n) \cdot (b_0,b_1,...,b_m) = (a_0 \cdot b_0,a_0 \cdot b_1,a_1 \cdot b_0,...,\sum_{i=0}^k a_i \cdot b_{k-i},...,a_n \cdot b_m)$

### Addition
$(a_0,a_1,...,a_n) + (b_0,b_1,...,b_m) = (a_0+b_0,a_1+b_1,...,a_n+b_n,b_{n+1},...,b_m)$

#### Schritt 1: Bezeichner und Datentypen
Die Funktion $\textcolor{red}{poly\_add}$ nimmt als Eingabe
  - $\textcolor{red}{p: list[complex]}$, ein Polynom.
  - $\textcolor{red}{q: list[complex]}$, ein Polynom.

Die Grade der Polynome ergeben sich aus der Länge der Sequenzen.

> $\textbf{Achtung:}$  
  Die Grade der Polynome können unterschiedlich sein!

#### Schritt 2: Funktionsgerüst
```{code-cell} ipython3
  def poly_add(p: list[complex], q: list[complex]) -> list[complex]:
    # fill in
    for i in range(...): # <<---
      pass # fill in action for each element
    return 
```

> $\textbf{Frage:}$  
Was ist das Argument ... von range?

#### Schritt 3: Beispiele
Es soll gelten:
  - poly_add([], []) == []
  - poly_add([42], []) == [42]
  - poly_add([], [11]) == [11]
  - poly_add([1,2,3], [4,3,2,5,5]) == [5,5,5,5,5]

> $\textbf{Antwort: }$ Argument von range
maxlen = max(len(p), len(q))

#### Schritt 4: Funktionsdefinition, erster Versuch
```{code-cell} ipython3
  def poly_add(p:list[complex], q: list[complex]) -> list[complex]:
    maxlen = max(len(p), len(q))
    result = []
    for i in range(maxlen):
      result = result + [p[i] + q[i]]
    return result
```

```{code-cell} ipython3
  :tags: ["raises-exception"]
  assert poly_add([], []) == []
  assert poly_add([42], []) == [42]
  assert poly_add([], [11]) == [11]
  assert poly_add([1,2,3], [4,3,2,5,5]) == [5,5,5,5,5]
```

> $\textbf{Problem: }$
Eine Assertion schlägt fehl!


> $\textbf{Analyse: }$
Zweite Assertion schlägt fehl für i = 0!

#### Addition -- Hilfsfunktion
Wunschdenken: $\textbf{Abstrahiere}$ die gewünschte Funktionalität in einer $\textbf{Hilfsfunktion}$.

##### Hilfsfunktion Schritt 1
Bezeichner und Datentypen

Die Funktion $\textcolor{red}{safe\_index}$ nimmt als Eingabe
  - $\textcolor{red}{p: list[complex]}$ eine Sequenz
  - $\textcolor{red}{i: int}$ einen Index (positiv)
  - $\textcolor{red}{d: complex}$ einen Ersatzwert für ein Element von p

  und liefert das Element p[i] (falls definiert) oder den Ersatzwert.

$\textbf{Sichere Indizierung | Addition}$
##### Hilfsfunktion Schritt 2
Funktionsgerüst
```{code-cell} ipython3
  def safe_index(p: list[complex], i: int, d: complex) -> complex:
    # fill in
    return 0
```

##### Hilfsfunktion Schritt 3
Es soll gelten:
  - safe_index([1,2,3], 0, 0) == 1
  - safe_index([1,2,3], 2, 0) == 3
  - safe_index([1,2,3], 4, 0) == 0
  - safe_index([1,2,3], 4, 42) == 42
  - safe_index([], 0, 42) == 42

##### Hilfsfunktion Schritt 4
Funktionsdefinition
```{code-cell} ipython3
  def safe_index(p: list[complex], i: int, d: complex) -> complex:
    return p[i] if i < len(p) else d
```
oder (alternative Implementierung des Funktionsrumpfes)
```{code-cell} ipython3
  def safe_index(p: list[complex], i: int, d: complex) -> complex:
    if i < len(p):
      return p[i]
    else:
      return d
```

#### Schritt 4: Funktionsdefinition mit Hilfsfunktion
```{code-cell} ipython3
  def poly_add(p: list[complex], q: list[complex]) -> list[complex]:
    maxlen = max(len(p), len(q))
    result = []
    for i in range(maxlen):
      result = result + [safe_index(p,i,0) + safe_index(q,i,0)]
    return result
```

#### Schritt 5: Testen
```{code-cell} ipython3
  assert safe_index([1,2,3], 0, 0) == 1
  assert safe_index([1,2,3], 2, 0) == 3
  assert safe_index([1,2,3], 4, 0) == 0
  assert safe_index([1,2,3], 4, 42) == 42
  assert safe_index([], 0, 42) == 42
```



$\textbf{Bedingter Ausdruck: }$

    expr_true if expr_cond else expr_false

  - Werte zuerst expr_cond aus
  - Falls Ergebnis kein Nullwert, dann werte expr_true als Ergebnis aus
  - Sonst werte expr_false als Ergebnis aus
  - Beispiele
      - 17 if True else 4 == 17
      - "abc"[i] if i<3 else "_"

### Multiplikation
$ (p_0,p_1,...,p_n) \cdot (q_0,q_1,...,q_m) = (p_0 \cdot q_0,p_0 \cdot q_1,p_1 \cdot q_0,...,\sum_{i=0}^k p_i \cdot q_{k-i},...,p_n \cdot q_m)$

#### Schritt 1: Bezeichner und Datentypen
Die Funktion $\textcolor{red}{poly\_mult}$ nimmt als Eingabe 
  - $\textcolor{red}{p: list[complex]}$ ein Polynom
  - $\textcolor{red}{q: list[complex]}$ ein Polynom

und liefert als Ergebnis das Produkt der Eingaben.

#### Schritt 2: Funktionsgerüst
```{code-cell} ipython3
  def poly_mult(p: list[complex], q: list[complex]) -> list[complex]:
    # fill in
    for k in range(...):
      pass # fill in to compute k-th output element
    return
```

#### Schritt 3: Beispiele 
Es soll gelten:
  - poly_mult([],[]) == []
  - poly_mult([42],[]) == []
  - poly_mult([],[11]) == []
  - poly_mult([1,2,3],[1]) == [1,2,3]
  - poly_mult([1,2,3],[0,1]) == [0,1,2,3]
  - poly_mult([1,2,3],[1,1]) == [1,3,5,3]

> $\textbf{Beobachtungen: }$
Range: maxlen = len(p) + len(q) - 1

#### Schritt 4: Funktionsdefinition
```{code-cell} ipython3
  def poly_mult(p: list[complex], q: list[complex]) -> list[complex]:
    result = []
    for k in range(len(p) + len(q) - 1):
      rk = ... #k-th output element
      result = result + [rk]
    return result
```


##### Das k-te Element
$ r_k = \sum_{i=0}^k p_i \cdot q_{k-i} $ Noch eine Schleife!

##### Berechnung 
    rk = 0
    for i in range(k+1):
      rk = rk + (safe_index(p,i,0) * safe_index(q,k-i,0))


finale Funktionsdefinition

```{code-cell} ipython3
  def poly_mult(p: list[complex], q: list[complex]) -> list[complex]:
    result = []
    for k in range(len(p) + len(q) - 1):
      rk = 0
      for i in range(k+1):
        rk = rk + (safe_index(p,i,0) * safe_index(q,k-i,0))
      result = result + [rk]
    return result
```

#### Schritt 5: Testen
```{code-cell} ipython3
  assert poly_mult([],[]) == []
  assert poly_mult([42],[]) == []
  assert poly_mult([],[11]) == []
  assert poly_mult([1,2,3],[1]) == [1,2,3]
  assert poly_mult([1,2,3],[0,1]) == [0,1,2,3]
  assert poly_mult([1,2,3],[1,1]) == [1,3,5,3]
```

### Lexikografische Ordnung
#### Gegeben
Zwei Sequenzen der Längen $m,n \ge 0$:
$\vec a = "a_1a_2...a_m"             \vec b = "b_1b_2...b_n"$
$\vec a \le \vec b$ in der lexikografischen Ordnung, falls
Es gibt $0 \le k \le min(m,n)$, sodass
  - $a_1 = b_1,...,a_k = b_k$ und
  $\textcolor{blue}{\vec a = "} \textcolor{magenta}{a_1a_2...a_k} \textcolor{blue}{a_{k+1}...a_m"}           \textcolor{blue}{\vec b = "} \textcolor{magenta}{a_1a_2...a_k} \textcolor{blue}{b_{k+1}...b_n"}
  - k = m
  \textcolor{blue}{\vec a = "} \textcolor{magenta}{a_1a_2...a_m} \textcolor{blue}{"} \textcolor{blue}{\vec b = "} \textcolor{magenta}{a_1a_2...a_m} \textcolor{blue}{b_{m+1}...b_n"}
  - oder k < m und $a_{k+1} \lt b_{k+1}$

#### Schritt 1: Bezeichner und Datentypen
Die Funktion $\textcolor{red}{lex\_leq}$ nimmt als Eingabe 
  - $\textcolor{red}{a: list}$ eine Sequenz
  - $\textcolor{red}{b: list}$ eine Sequenz

und liefert als Ergebnis True falls $a \le b$ sonst False.

#### Schritt 2: Funktionsgerüst
```{code-cell} ipython3
  def lex_leq(a: list, b: list) -> bool:
    # fill in
    for k in range(...):
      pass # fill in
    return ...
```

#### Schritt 3: Beispiele
Es soll gelten:
  - lex_leq([], []) == True
  - lex_leq([42], []) == False
  - lex_leq([], [11]) == True
  - lex_leq([1,2,3], [1]) == False
  - lex_leq([1], [1,2,3]) == True
  - lex_leq([1,2,3], [0,1]) == False
  - lex_leq([1,2,3], [1,3]) == True
  - lex_leq([1,2,3], [1,2,3]) == True

> $\textbf{Beobachtungen: }$
Range minlen = min (len(a), len(b))

#### Schritt 4: Funktionsdefinition
```{code-cell} ipython3
  def lex_leq(a: list, b: list) -> bool:
    minlen = min (len (a), len (b))
    for k in range(minlen):
        if a[k] < b[k]:
            return True
        if a[k] > b[k]:
            return False
    # a is prefix of b or vice versa
    return len(a) <= len(b)
```

#### Schritt 5: Testen
```{code-cell} ipython3
  assert lex_leq([], []) == True
  assert lex_leq([42], []) == False
  assert lex_leq([], [11]) == True
  assert lex_leq([1,2,3], [1]) == False
  assert lex_leq([1], [1,2,3]) == True
  assert lex_leq([1,2,3], [0,1]) == False
  assert lex_leq([1,2,3], [1,3]) == True
  assert lex_leq([1,2,3], [1,2,3]) == True
```


#### Exkursion: Typannotation für lexleq
$\textbf{Problem}$
  - Der Typ list charakterisiert Listen mit beliebigen Elementen
  - Aber: Vergleich von beliebigen Listen ist nicht möglich!
  Beispiel: lex_leq("abc",[1,2,3]) liefert Fehler!
  - Wir müssen sicherstellen:
    1. die Elemente haben den gleichen Typ und
    2. dieser Typ unterstützt Ordnungen.

##### Erster Versuch

    A = TypeVar("A")

definiert eine $\textcolor{red}{Typvariable}$. Damit kennzeichnet der Typ list[A] eine Liste, in der alle Elemente den gleichen Typ A haben, aber ...
  - wir wissen nicht was A ist und
  - wir wissen nicht, ob A Ordnungen unterstützt.

##### Erweiterte Lösung

    B = TypeVar("B", int, float, str)

... wieder eine Typvariable, aber jetzt ist bekannt, dass sie für einen der aufgelisteten Typen int, float oder str steht.

    def lex_leq(a: list[B], b: list[B]) -> bool:

bedeutet: a und b sind beides Listen, deren Elemente entweder int, float oder str sind und daher vergleichbar!

##### Bewertung
ok, aber was ist mit list[int], list[list[int]] usw? Alle diese Typen sind auch vergleichbar...

## 2 while-Schleifen
Wiederholen eines Schleifenrumpfs, ohne dass vorher klar ist, wie oft.
### Die while-Schleife
#### Beispiele
  - Einlesen von mehreren Eingaben
  - Das Newton-Verfahren zum Auffinden von Nullstellen
  - Das Collatz-Problem

#### Syntax
    while Bedingung:
      Block  # Schleifenrumpf
#### Semantik
Die Anweisungen im Block werden wiederholt, solange die Bedingung keinen nullwert (z.B. True) liefert.

### Einlesen einer Liste
#### Schritt 1: Bezeichner und Datentypen
Die Funktion $\textcolor{red}{input\_list}$ nimmt keine Parameter, erwartet eine beliebig lange folge von Eingaben, die mit einer leeren Zeile abgeschlossen ist, und liefert als Ergebnis die Liste dieser Eingaben als Strings.

#### Schritt 2: Funktionsgerüst
```{code-cell} ipython3
  def input_list() -> list[str]:
    # fill in, initialization
    while expr_cond:
      pass # fill in
    return 
```

$\textbf{Warum while?}$
  - Die Anzahl der Eingaben ist nicht von vorne herein klar.
  - Dafür ist eine while-Schleife erforderlich.
  - Die while-Schleife führt ihren Rumpf wiederholt aus, solange nicht-leere Eingaben erfolgen.

#### Schritt 3: Beispiele
    Eingabe:
      >>> input_list()

      []
      >>> input_list()
      Bring
      mal
      das
      WLAN-Kabel!

      ['Bring', 'mal', 'das', 'WLAN-Kabel!']

#### Schritt 4: Funktionsdefinition
```{code-cell} ipython3
  def input_list() -> list[str]:
    result = []
    line = input()
    while line:
      result = result + [line]
      line = input()
    return result
```

### Das Newton-Verfahren
Suche Nullstellen von stetig differenzierbaren Funktionen
#### Verfahren
f: $\R \to \R$ sei stetig differenzierbar
  1. Wähle $x_0 \in \R$, $n = 0$
  2. Setze $x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}$
  3. Berechne nacheinander $x_1,x_2,...,x_k$ bis $f(x_k)$ nah genug an 0.
  4. Ergebnis ist $x_k$

#### Präzisierung
##### ... für Polynomfunktion
  - Erfüllen die Voraussetzung
  - Ableitung mit derivative

##### Was heißt hier "nah genug"?
  - Eine überraschend schwierige Frage \dots
  - Wir sagen: $x$ ist nah genug an $x'$, falls $\frac{|x-x'|}{|x|+|x'|}< \varepsilon$
  - $\varepsilon>0$ ist eine Konstante, die von der
    Repräsentation von float, dem Verfahren und der
    gewünschten Genauigkeit abhängt. Dazu kommen noch Sonderfälle.
  - Wir wählen: $\varepsilon = 2^{-20} \approx 10^{-6}$
  - Genug für eine Hilfsfunktion!

##### Hilfsfunktion
Die freundlichen Pythonistas waren schon für uns aktiv.
  pytest ist ein Modul zur Erstellung von
  Tests.Darin ist eine passende Hilfsfunktion definiert:

    from pytest import approx

Diese Funktion erzeugt eine approximative Zahl, bei der Operator == ähnlich wie "nah genug" implementiert ist.
Es reicht, wenn ein Argument approximativ ist.
Alternative: verwende math.isclose() ...

#### Schritt 1: Bezeichner und Datentypen
Die Funktion $\textcolor{red}{newton}$ nimmt als Eingabe
  - $\textcolor{red}{f: list[float]}$ ein Polynom
  - $\textcolor{red}{x0: float}$ einen Startwert

und verwendet das Newton-Verfahren zur Berechnung einer Zahl x, sodass f(x) "nah genug" an 0 ist.

#### Schritt 2: Funktionsgerüst
```{code-cell} ipython3
  from pytest import approx
  def newton(f: list[float], x0: float) -> float:
    # fill in
    while expr_cond:
      pass # fill in
    return
```

$\textbf{Warum while?}$

  - Das Newton-Verfahren verwendet eine Folge x_n, ohne dass von vorne herein klar ist, wieviele Elemente benötigt werden.
  - Zur Verarbeitung dieser Folge ist eine while-Schleife erforderlich.
  - Diese while-Schleife terminiert aufgrund der mathematischen/ numerischen Eigenschaften des Newton-Verfahrens. Siehe Vorlesung Mathe I.

Beispielfunktion: $f(x) = x^3 - 6x^2 + 11x - 6
...

#### Schritt 3: Beispiele
für p = [-6, 11, -6, 1] sollen:
  - newton (p, 0)   == approx(1)
  - newton (p, 1.1) == approx(1)
  - newton (p, 1.7) == approx(2)
  - newton (p, 2.5) == approx(1)
  - newton (p, 2.7) == approx(3)
  - newton (p, 10)  == approx(3)

#### Schritt 4: Funktionsdefinition
```{code-cell} ipython3
  from pytest import approx
  def newton(f: list[float], x0: float) -> float:
    deriv_f = derivative(f)
    xn = x0
    while poly_eval(f, xn) != approx(0):
      xn = xn -(poly_eval(f,xn) / poly_eval(deriv_f, xn))
    return xn
```

#### Schritt 5: Testen
```{code-cell} ipython3
  p = [-6, 11, -6, 1] 
  assert newton (p, 0)   == approx(1)
  assert newton (p, 1.1) == approx(1)
  assert newton (p, 1.7) == approx(2)
  assert newton (p, 2.5) == approx(1)
  assert newton (p, 2.7) == approx(3)
  assert newton (p, 10)  == approx(3)
```

### Das Collatz-Problem
#### Verfahren
(Collatz 1937)

Starte mit einer ganzen positiven Zhal $n$ und definiere eine Folge $n = a_0,a_1,a_2,...$:
> $\textbf{Offene Frage: }$ 
Für welche Startwerte $n$ gibt es ein $i$ mit $a_i = 1$?
##### Beispiele (Folge der durchlaufenen Zahlen)
  - [3, 10, 5, 16, 8, 4, 2, 1]
  - [7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]

#### Funktionsdefinition
```{code-cell} ipython3
  def collatz(n: int) -> list[int]:
    result = [n]
    while n > 1:
      if n % 2 == 0:
        n = n // 2
      else:
        n = 3 * n + 1
      result = result + [n]
    return result
```

$\textbf{Warum while?}$
  - Es ist nicht bekannt, ob collatz(n) für jede Eingabe terminiert.
  - Aber validiert für alle $ n \lt 20 \cdot 2^58 \approx 5.7646 \cdot 10^18$ (Oliveira e Silva).

### Abschließende Bermerkungen
#### Termination einer Schleife
  - Die Anzahl der Durchläufe einer for-Schleife ist stets durch den Schleifenkopf vorgegeben:
    - for element in seq:
      Anzahl der Elemente in der Sequenz seq
    - for i in range(...):
      Größe des Range
  - Daher $\textcolor{red}{terminiert}$ die Ausführung einer for-Schleife i.a.
  - Bei einer while-Schleife ist die Anzahl der Durchläufe $\textcolor{red}{nicht\,a-priori\,klar}$.
  - Daher ist stets einer Überlegung erforderlich, ob eine while-Schleife terminiert ($\textcolor{red}{Terminationsbedingung}$).
  - Die Terminationsbedingung $\textcolor{red}{muss}$ im Programm z.B. als Kommenatr dokumentiert werden.

#### Beispiel Zweierlogarithmus (Terminationsbedingung)
$\textcolor{blue}{Zweierlogarithmus}$
```{math}
  \begin{align*}
    log_2 a &= b \\
    2^b &= a \\
    a &> 0
  \end{align*}
```

$\textcolor{blue}{für\,ganze\,Zahlen}$
```{math}
  \begin{align*}
    l2(n) &= m \\
    m &= \lfloor \log_2 n \rfloor \\
    n &> 0
  \end{align*}
```


##### Implementierung Zweierlogarithmus
```{code-cell} ipython3
  def l2(n:int) -> int:
    m = -1
    while n > 0:
      m = m + 1
      n = n // 2
    return m
```

##### Terminationsbedingung
  - Die while-Schleife terminiert, weil für alle n > 0 gilt, dass n > n // 2 und jede Folge von positiven Zahlen n1 > n2 > ... abbricht.
  - Die Anzahl der Schleifendurchläufe ist durch $log_2n$ beschränkt.

## Zusammenfassung
  - Funktionen über $\textcolor{red}{Sequenzen}$ verwenden $\textcolor{red}{for-in-Schleifen}$.
  - Ergebnisse werden meist in einer $\textcolor{red}{Akkumulator}$ Variable berechnet.
  - Funktionen über $\textcolor{red}{mehreren\,Sequenzen}$ verwenden $\textcolor{red}{for-range-Schleifen}$.
  - Der verwendete Range hängt von der Problemstellung ab.
  - Nicht-triviale Teilprobleme werden in Hilfsfunktionen ausgelagert.
  - while-Schleifen werden verwendet, wenn die Anzahl der
    Schleifendurchläufe nicht von vorne herein bestimmt werden kann oder soll,
    typischerweise
    - zur Verarbeitung von Eingaben
    - zur Berechnung von Approximationen
  - Jede while-Schleife muss eine $\textcolor{red}{dokumentierte\,Terminationsbedingung}$ haben.

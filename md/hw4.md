**UC San Diego, Fall 2025**

---

**Name:** Zixuan Wang

**PID:** A1924782

---

### Problem 1
For $A=\alpha I_n$ with $\alpha\in\mathbb{R},\ \alpha\neq0$:

$$
||A||=\max_{x\neq0}\frac{||Ax||}{||x||}=\max_{x\neq0}\frac{||\alpha I x||}{||x||}=\max_{x\neq0}\frac{||\alpha x||}{||x||}=|\alpha|\max_{x\neq0}\frac{||x||}{||x||}=|\alpha|
$$

$$
A^{-1}=\frac{1}{\alpha}I, \text{ so } ||A^{-1}||=\frac{1}{|\alpha|}
$$

$$\det(A)=\det(\alpha I_n)=\alpha^n$$

The condition number is:

$$\kappa_{||\cdot||}(A)=||A|| \cdot ||A^{-1}||=|\alpha|\cdot\frac{1}{|\alpha|}=1$$

---

### Problem 2

(a)
$$
\kappa(A^{-1}) = ||A^{-1}|| · ||(A^{-1})^{-1}|| = ||A^{-1}|| · ||A||
$$

$$
\kappa(A^{-1}) = ||A|| · ||A^{-1}|| = \kappa(A).
$$

(b)

$$
A(x + \delta x) = b + \delta b.
$$

$$
Ax=b
$$
$$
x = A^{-1}b
$$
$$
||x|| = ||A^{-1}b|| \le ||A^{-1}|| · ||b|| \quad (1)
$$
$$
A \delta x = \delta b.
$$

$$
||\delta b || = ||A \delta x|| \le ||A|| · ||\delta x|| \quad (2)
$$

$$
(1) * (2) \quad ||x||·||\delta b|| \le ||A^{-1}|| · ||A|| · ||b|| · ||\delta x||
$$

Thus we proved Condition inequality:

$$
\frac{||\delta b||}{||b||} \le \kappa(A) · \frac{||\delta x||}{||x||}
$$

Thus the upper bound and lower bound of $\frac{||\delta x||}{||x||}$ is
$$
\frac{1}{\kappa(A)} \frac{||\delta b||}{||b||} \le \frac{||\delta x||}{||x||} \le \kappa(A) \frac{||\delta b||}{||b||} 
$$
---

### Problem 3

$$A=\begin{pmatrix}3&0&2\\2&0&-2\\0&1&1\end{pmatrix}, \quad b=\begin{pmatrix}0\\1\\1\end{pmatrix}$$

(a) Matrix norms

Compute column/row sums and Frobenius norm.

* 1-norm (induced) $$||A||_1=\max_{j}\sum_i||a_{ij}||$$
  Columns sums: $$||3||+||2||+0=5, \quad 0+0+1=1, \quad ||2||+||-2||+||1||=5$$
  So $$\boxed{||A||_1=5}$$

* $\infty$-norm (induced) $$||A||_\infty=\max_i\sum_j||a_{ij}||$$
  Row sums: $$||3||+0+||2||=5, \quad ||2||+0+||-2||=4, \quad 0+1+1=2$$
  So $$\boxed{||A||_\infty=5}$$

* Frobenius norm $$||A||_F=\sqrt{\sum_{i,j}a_{ij}^2}$$
  Sum of squares $$=3^2+0^2+2^2+2^2+0^2+(-2)^2+0^2+1^2+1^2=23$$
  So $$\boxed{||A||_F=\sqrt{23}\approx 4.796}$$

---

(b)

First compute $A^{-1}$. One gets:

$$A^{-1}=\begin{pmatrix}
1/5 & 1/5 & 0 \\
-1/5 & 3/10 & 1 \\
1/5 & -3/10 & 0
\end{pmatrix}$$

Its norms:

**$||A^{-1}||_1$:** Column sums are $1/5+1/5+1/5=3/5$, $1/5+3/10+3/10=1$, $0+1+0=1$

So $\boxed{||A^{-1}||_1=1}$

**$||A^{-1}||_\infty$:** Row sums are $1/5+1/5+0=2/5$, $1/5+3/10+1=1.45$, $1/5+3/10+0=0.5$

So $\boxed{||A^{-1}||_\infty=1.5}$

**$||A^{-1}||_F$:** $||A^{-1}||_F=\sqrt{\sum_{i,j}[A^{-1}]_{ij}^2}= \frac{\sqrt{23}}{10}\approx 1.1576$

Now multiply:

- $\kappa_1(A)=||A||_1||A^{-1}||_1=5\cdot 1=\boxed{5}$
- $\kappa_\infty(A)=||A||_\infty||A^{-1}||_\infty=5\cdot 1.5=\boxed{7.5}$
- $\kappa_F(A)=||A||_F||A^{-1}||_F=4. 79 \times 1.158 \approx\boxed{5.55}$


(c)

Solve $Ax=b$. One finds:

$$x=A^{-1}b=\begin{pmatrix}1/5\\13/10\\-3/10\end{pmatrix}$$

For $\delta b=(\varepsilon,0,0)^T$:

$$\delta x=A^{-1}\delta b=\begin{pmatrix}\varepsilon/5\\-\varepsilon/5\\\varepsilon/5\end{pmatrix}$$

Compute norms and relative errors in the 1- and $\infty$-norms (leave $||\varepsilon||$ symbolic):

Vector norms of $x$:
$$||x||_1=\frac{1}{5}+\frac{13}{10}+\frac{3}{10}=\frac{9}{5}=1.8, \qquad ||x||_\infty=\max\{1/5,13/10,3/10\}=\frac{13}{10}=1.3$$
Norms of the perturbation $\delta x$:
$$||\delta x||_1=\frac{3||\varepsilon||}{5}=0.6||\varepsilon||, \qquad ||\delta x||_\infty=\frac{||\varepsilon||}{5}=0.2||\varepsilon||$$

So the exact relative forward errors are:
$$\frac{||\delta x||_1}{||x||_1}=\frac{0.6||\varepsilon||}{1.8}=\frac{1}{3}||\varepsilon||\approx 0.333333||\varepsilon||$$
$$\frac{||\delta x||_\infty}{||x||_\infty}=\frac{0.2||\varepsilon||}{1.3}=\frac{2}{13}||\varepsilon||\approx 0.153846||\varepsilon||$$

Relative change in the right-hand side:
$$\frac{||\delta b||_1}{||b||_1}=\frac{||\varepsilon||}{2}=0.5||\varepsilon||, \qquad \frac{||\delta b||_\infty}{||b||_\infty}=\frac{||\varepsilon||}{1}=||\varepsilon||$$

Now compare with the condition-number bounds:

$$\frac{||\delta x||}{||x||}\le \kappa(A)\frac{||\delta b||}{||b||}$$

For the 1-norm $\kappa_1(A)=5$
- Upper bound: $5\cdot\frac{||\varepsilon||}{2}=2.5||\varepsilon||$
- Lower bound: $\frac{1}{5}\cdot\frac{||\varepsilon||}{2}=0.1||\varepsilon||$
- Actual relative error: $0.3333||\varepsilon|| \in [0.1||\varepsilon||, 2.5||\varepsilon||]$

For the $\infty$-norm $\kappa_\infty(A)=7.5$
- Upper bound: $7.5\cdot||\varepsilon||=7.5||\varepsilon||$
- Lower bound: $\frac{1}{7.5}||\varepsilon||\approx 0.13333||\varepsilon||$
- Actual relative error: $\approx 0.15385||\varepsilon|| \in [0.13333||\varepsilon||, 7.5||\varepsilon||]$

Computed exact errors are consistent with the conditional  bounds

But the $\kappa_F(A)$ not in the same way:

$\kappa_F(A)=||A||_F||A^{-1}||_F$ 
is a valid matrix condition number, but the Frobenius norm is not an induced operator nohmidt inner prodrm for vectors. Because the standard forward-error bound $\frac{||\delta x||}{||x||}\le \kappa(A)\frac{||\delta b||}{||b||}$ is derived using compatibility of the chosen matrix norm with the chosen vector norm (i.e. $||M v||\le ||M||||v||$ where $||\cdot||$ on vectors and matrices are compatible), you cannot directly replace both vector norms by "Frobenius" and get an identical form. In particular the Frobenius norm is a matrix norm but not a vector norm, so the same simple relative-error inequality does not hold with $\kappa_F$ in place of $\kappa_1$ or $\kappa_\infty$.

---

### Problem 4

1% change in $b$ does not correspond to multiplying the whole vector by 1.01. 1% change" in $b$ usually means $b \to b + \Delta b$ where $||\Delta b|| / ||b|| = 0.01$. That $\Delta b$ is not necessarily in the same direction as $b$. It could affect different components differently.
For ill-conditioned matrices $A$, a small change in $b$ can cause a much larger relative change in $x$ than the change in $b$. The linearity argument ignores this amplification. 

Consider

$$
A = \begin{bmatrix} 1 & 0 \\ 0 & 0.001 \end{bmatrix}, \quad b = \begin{bmatrix} 1 \\ 0 \end{bmatrix}, \quad x = \begin{bmatrix} 1 \\ 0 \end{bmatrix}
$$
If 
$$
\Delta b = \begin{bmatrix} 0 \\ 0.01 \end{bmatrix}
$$
Then $\hat x = A^{-1}b = \begin{bmatrix} 1 \\ 100 \end{bmatrix}$
A tiny change in $b_2$ causes a huge change in $x_2$. This contradicts the "1% change in x" claim.

---

### Problem 5











1. **Condition number:**
   The condition number of $A$ in 1-norm, `cond(A,1)`, measures how sensitive the solution $x$ is to changes in $b$:
   $
   \frac{|| \tilde{x} - x ||}{||x||} \le \text{cond}(A) \frac{||\delta b||}{||b||}
   $
   So $q = \text{cond}(A,1) \cdot \text{rel error in } b$ is an **upper bound** on the relative error in the solution.

2. **Why $q < 1$ is expected:**
   In our experiment, the perturbation δb is very small ($10^{-3}$), so even though `cond(A)` might be large, $q$ usually remains less than 1. This matches the theory: small perturbations in $b$ lead to small relative errors in $x$.

3. **Logarithmic plot:**
   Plotting `log10(q)` gives a clear view of the magnitude. If `log10(q) < 0`, it means `q < 1`, which aligns with the theoretical prediction.

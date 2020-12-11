(defun complemento (expensa) (- 2020 expensa))
(defun tenemosSuComplemento (expensa expensas) (find (complemento expensa) expensas))
(defun solucionarProblema (expensas)
    (find-if (lambda (expensa) (tenemosSuComplemento expensa expensas)) expensas))
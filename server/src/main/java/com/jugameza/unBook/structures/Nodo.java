package com.jugameza.unBook.structures;

public class Nodo<T> {

    private T inf;
    private Nodo<T> ref;

    public T getInf() {
        return inf;
    }

    public void setInf(T inf) {
        this.inf = inf;
    }

    public Nodo<T> getRef() {
        return ref;
    }

    public void setRef(Nodo<T> ref) {
        this.ref = ref;
    }

}

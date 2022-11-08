package com.jugameza.unBook.structures;


public class LinkedList<T> {

    // Declare the pointer
    private Nodo<T> p;

    public void add(T inf){

        // Add the information in a new nodo
        Nodo<T> newNodo = new Nodo<>();
        newNodo.setInf(inf);

        // Add the first list nodo like reference in the new nodo
        newNodo.setRef(this.p);

        // Change the pointer direction to the new nodo linked with the list
        this.p = newNodo;

    }

    public T get(int position){

        // Declare an auxiliary pointer to handle the list without lost information
        Nodo<T> aux = this.p;

        // Find the right position in the list
        int i = 0;
        while(i < position){
            aux = aux.getRef();
            i++;
        }

        return aux != null? aux.getInf(): null;

    }

    public void push(T inf){

        // Add the information in a new nodo
        Nodo<T> newNodo = new Nodo<>();
        newNodo.setInf(inf);

        // Verify if the list is void
        if(this.p == null){
            // The pointer will have the reference to the new nodo if the list is void
            this.p = newNodo;
            // If the list was void, the method would finish here
            return;
        }

        // Declare an auxiliary pointer to handle the list without lost information
        Nodo<T> aux = this.p;

        // Find the last nodo in the list
        while(aux.getRef() != null){
            aux = aux.getRef();
        }

        // Change the reference of the last nodo to the new nodo reference
        aux.setRef(newNodo);

    }

    public T pop(){

        T value;

        if(this.p == null){
            value = null;
        }
        else if(this.p.getRef() == null){
            value = this.p.getInf();
            this.p = null;
        }
        else{

            Nodo<T> befAux = new Nodo<T>();
            Nodo<T> aux = this.p;

            while (aux.getRef() != null){
                befAux = aux;
                aux = aux.getRef();
            }

            value = aux.getInf();

            befAux.setRef(null);

        }

        return value;

    }

    public void remove(T value){

        if(this.p == null){
            this.p = null;
            return;
        }

        if(this.p.getRef() == null && this.p.getInf() == value){
            this.p = null;
            return;
        }

        Nodo<T> aux = this.p;
        Nodo<T> befAux = this.p;

        while(aux.getInf() != value && aux.getRef() != null){
            befAux = aux;
            aux = aux.getRef();
        }

        befAux.setRef(null);

    }

    public T delete(){

        Nodo<T> aux = this.p;

        if(aux == null){
            return null;
        }

        if(aux.getRef() == null){
            this.p = null;
            return aux.getInf();
        }

        T result = aux.getInf();
        this.p  = aux.getRef();

        return result;
    }

    public void clear(){
        this.p = null;
    }

    public void set(int position, T value){

        // Declare an auxiliary pointer to handle the list without lost information
        Nodo<T> aux = this.p;

        // Find the right position in the list
        for (int i = 0; i < position; ++i) aux = aux.getRef();

        aux.setInf(value);

    }

    public int length(){

        int length = 0;

        Nodo<T> aux = this.p;
        if(aux == null){
            return length;
        }

        ++length;

        while (aux.getRef() != null){
            aux = aux.getRef();
            ++length;
        }

        return length;

    }

    public boolean isEqual(LinkedList<T> linkedList){

        final int length = linkedList.length();

        if(length != this.length()){
            return false;
        }

        Nodo<T> aux = this.p;
        boolean isEqual = true;
        for (int i = 0; i < length; ++i){

            if(!aux.getInf().equals(linkedList.get(i))){
                isEqual = false;
                break;
            }

            aux = aux.getRef();

        }

        return isEqual;

    }

    public int indexOf(T value){

        int result = -1;

        Nodo<T> aux = this.p;
        if(aux == null){
            return result;
        }

        boolean found = false;
        while (aux.getRef() != null){
            ++result;
            if(aux.getInf().equals(value)) {
                found = true;
                break;
            }
            aux = aux.getRef();
        }

        if(aux.getRef() == null && aux.getInf().equals(value)){
            return ++result;
        }

        return (found)? result : -1;

    }

    @Override
    public String toString() {

        // Verify if the list is void
        if(this.p == null){
            return "[]";
        }

        // Create a string tho show the information
        String list = "[";

        // Declare an auxiliary pointer to handle the list without lost information
        Nodo<T> aux = this.p;
        while(aux.getRef() != null){
            list += aux.getInf() + ",";
            aux = aux.getRef();
        }
        list += aux.getInf() + "]";

        return list;

    }
}
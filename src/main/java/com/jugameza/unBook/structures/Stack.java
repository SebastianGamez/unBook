package com.jugameza.unBook.structures;

public class Stack<T> {

    LinkedList<T> list = new LinkedList<>();

    public void pile(T value){

        list.add(value);

    }

    public T unPile(){

        return list.delete();

    }

    public T get(int posistion){

        return list.get(posistion);

    }

    public void set(int position, T value){

        list.set(position, value);

    }

    @Override
    public String toString() {
        return list.toString();
    }
}

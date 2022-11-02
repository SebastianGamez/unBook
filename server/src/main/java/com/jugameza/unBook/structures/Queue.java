package com.jugameza.unBook.structures;

public class Queue<T> {

    LinkedList<T> list = new LinkedList<>();

    public void queueUp(T value){
        this.list.add(value);
    }

    public T unQueue(){
        return this.list.pop();
    }

    public T get(int value){
        return this.list.get(value);
    }

    public void set(int position, T value){
        this.list.set(position, value);
    }

    public int length(){
        return this.list.length();
    }

    @Override
    public String toString(){
        return list.toString();
    }

}

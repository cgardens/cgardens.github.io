---
title: "Java 8 Streams Gotchas"
date: 2021-06-19T17:11:46-07:00
draft: true
---

I learned something today. Anyone able to guess what this code snippet prints out? It's a stream flatmapped inside a stream flatmapped inside a stream. I'll put the answer in the thread, so don't open the thread if you want to puzzle about it first.

```java
 class Foo {
  public static void main(String[] args) {
    final Stream<Integer> stream = Stream.of(1)
        .peek(i -> System.out.println("outer stream"))
        .flatMap(i -> {
          return Stream.of(1)
              .peek(i1 -> System.out.println("middle stream"))
              .flatMap(i2 -> {
                return Stream.of(1).peek(i3 -> System.out.println("inner stream"))
                    .onClose(() -> System.out.println("inner stream closed"));
              })
              .onClose(() -> System.out.println("middle stream closed"));
        }).onClose(() -> System.out.println("outer stream closed"));
    System.out.println("collection is about to start");
    stream.collect(Collectors.toList());
    System.out.println("collection is done");
  }
} 
```

answer:
```
collection is about to start
outer stream
middle stream
inner stream
inner stream closed
middle stream closed
collection is done
```
the outer stream, while operated upon is never closed.

it does mean if you need to guarantee a stream gets closed if it is fully consumed but don't trust the consumer to close it you can do something like this i think.
```java
thisStreamMayNotBeClosed = Stream.of(1).flatMap(i -> butThisStreamWillBeClosed);
```
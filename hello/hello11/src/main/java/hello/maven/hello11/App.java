package hello.maven.hello11;


import java.io.*;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Enumeration;
import java.util.zip.*;

import org.agrona.MutableDirectBuffer;
import org.agrona.ExpandableArrayBuffer;

import io.netty.buffer.ByteBuf;
import static io.netty.buffer.Unpooled.*;
/**
 * Hello world!
 *
 */
public class App 
{
    public static void testZip() {
//        //压缩
//        ZipUtils.compress("c:\\tmp\\0307003000140014_20220704190813.db","F:\\test.zip");
        ///解压
        try {
            ZipUtils.decompress("c:\\tmp\\0307003000140014_20220704190813.db","c:\\tmp\\xx1.txt");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("解压文件夹失败");
        }
    }

    public static void helloBuffer1() {
        int x=10;
        int y=25;
        int z=x+y;

        long value = 1658969326785L;
//        byte[] bytes = ByteBuffer.allocate(8).putLong(value).array();
//        byte[] bytes = new byte[8];

        MutableDirectBuffer buffer = new ExpandableArrayBuffer(256);
        buffer.putLong(0, value, java.nio.ByteOrder.LITTLE_ENDIAN);
//        int bits = buffer.getInt(0, java.nio.ByteOrder.LITTLE_ENDIAN);
//        bits = value ? bits | (1 << 0) : bits & ~(1 << 0);
        byte[] bytes = buffer.byteArray();
        System.out.println("Sum of x+y = " + bytes[0]);
        System.out.println("Sum of x+y = " + bytes[1]);
        System.out.println("Sum of x+y = " + bytes[7]);
    }

    public static void helloBuffer2() {
        ByteBuf heapBuffer    = buffer(128);
        ByteBuf directBuffer  = directBuffer(256);
        ByteBuf wrappedBuffer = wrappedBuffer(new byte[128], new byte[256]);
        ByteBuf copiedBuffer  = copiedBuffer(ByteBuffer.allocate(128));
//        heapBuffer 普通的buff是固定大小的堆buff
//        directBuffer 是固定大小的direct buff。direct buff使用的是堆外内存，省去了数据到内核的拷贝，因此效率比普通的buff要高。
//        wrappedBuffer 是对现有的byte arrays或者byte buffers的封装，可以看做是一个视图，当底层的数据发生变化的时候，Wrapped buffer中的数据也会发生变化。
//        copiedBuffer 是对现有的byte arrays、byte buffers 或者 string的深拷贝，所以它和wrappedBuffer是不同的，Copied buffer和原数据之间并不共享数据。
    }

    public static void main( String[] args )
    {
        System.out.println( "Hello World! begin:" );

        helloBuffer1();

        System.out.println( "Hello World! end." );
    }
}

public class WordDocument implements Document {
    @Override
    public void open() {
        System.out.println(" Word document is Open..");
    }

    @Override
    public void close() {
        System.out.println("Word document is Closed..");
    }
}


abstract class DocumentFactory {
    public abstract Document createDocument();
}

class WordDocumentFactory extends DocumentFactory {
    @Override
    public Document createDocument() {
        return new WordDocument();
    }
}

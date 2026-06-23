public class ExcelDocument implements Document {
    @Override
    public void open() {
        System.out.println("Excel document is Open..");
    }

    @Override
    public void close() {
        System.out.println("Excel document is Closed..");
    }
}


class ExcelDocumentFactory extends DocumentFactory {
    @Override
    public Document createDocument() {
        return new ExcelDocument();
    }
}

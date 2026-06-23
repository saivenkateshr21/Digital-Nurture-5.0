public class PdfDocument implements Document {
    @Override
    public void open() {
        System.out.println("PDF document is Open..");
    }

    @Override
    public void close() {
        System.out.println("PDF document is Closed..");
    }
}

class PdfDocumentFactory extends DocumentFactory {
    @Override
    public Document createDocument() {
        return new PdfDocument();
    }
}

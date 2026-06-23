public class FactoryMethodTest {
    public static void main(String[] args) {
        // Create factory instances
        DocumentFactory wordFactory = new WordDocumentFactory();
        DocumentFactory pdfFactory = new PdfDocumentFactory();
        DocumentFactory excelFactory = new ExcelDocumentFactory();

        // Create documents 
        Document wordDoc = wordFactory.createDocument();
        Document pdfDoc = pdfFactory.createDocument();
        Document excelDoc = excelFactory.createDocument();

        wordDoc.open();
        wordDoc.close();

        pdfDoc.open();
        pdfDoc.close();

        excelDoc.open();
        excelDoc.close();
    }
}

### Swift CoreML Transformer

https://github.com/huggingface/swift-coreml-transformers

https://github.com/huggingface/swift-coreml-transformers/tree/master/Resources

https://github.com/huggingface/swift-coreml-transformers/blob/master/Resources/distilgpt2-64-6.mlmodel

https://github.com/huggingface/swift-coreml-transformers/blob/master/Resources/gpt2.mlmodel

- Intergrating GPT2Model and Bart

### Code

```swift
struct ContentView: View {

    @State private var text = ""

    let model = GPT2(strategy: .greedy)
    @State private var predictionLabel: String = ""

    var body: some View {
        VStack {

            TextField("Enter Prompt", text: self.$text)
                .padding()

            Button("Generate") {

                // generate the text
                let text = self.text

                // Particular Background Service
                DispatchQueue.global(qos: .userInitiated).async {
                    let _ = self.model.generate(text: text) { completion, time in
                        DispatchQueue.main.async {
                            self.predictionLabel = completion
                        }
                    }
                }

            }.padding()

            Text(self.predictionLabel)
                .font(.largeTitle)
                .padding()
        }

    }
}
```

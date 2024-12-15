import gradio as gr
from ktem.app import BasePage
from theflow.settings import settings as flowsettings


class ChatSuggestion(BasePage):
    def __init__(self, app):
        self._app = app
        self.on_building_ui()

    def on_building_ui(self):
        chat_samples = getattr(
            flowsettings,
            "KH_FEATURE_CHAT_SUGGESTION_SAMPLES",
            [
                "What are the legal requirements for opening a bank account, getting a driver's license, or renting a property?",
                "Can I start my own business, and what are the legal steps to register it?",
                "What documents are legally required for renting (e.g., passport, work permit, proof of income)?",
                "Are foreigners allowed to purchase property in the country? If so, are there restrictions on land ownership?",
            ],
        )
        self.chat_samples = [[each] for each in chat_samples]
        with gr.Accordion(
            label="Chat Suggestion",
            visible=getattr(flowsettings, "KH_FEATURE_CHAT_SUGGESTION", False),
        ) as self.accordion:
            self.examples = gr.DataFrame(
                value=self.chat_samples,
                headers=["Next Question"],
                interactive=False,
                wrap=True,
            )

    def as_gradio_component(self):
        return self.examples

    def select_example(self, ev: gr.SelectData):
        return {"text": ev.value}
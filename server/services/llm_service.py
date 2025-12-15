import google.generativeai as genai
from config import Settings


settings = Settings()

class LLMservice:
    def __init__(self):
        genai.configure(api_key=settings.GEMINI_API_KEY)    
        self.model = genai.GenerativeModel("gemini-2.5-flash")
    def generate_response(self, query: str, search_results: list[dict]):
        context_text = "\n\n".join([f"Source {i+1} ({res['url']}):\n {res['content']}"
            for i, res in enumerate(search_results)])
        
        full_prompt = f""" 
        context from web search:
        {context_text}

        query:
        {query}

        please provide a concise and informative answer based on the above context.
        Cite the sources used in your response.

        """

        response = self.model.generate_content(full_prompt, stream=True)
        for chunk in response:
            yield chunk.text
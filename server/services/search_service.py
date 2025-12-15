from config import Settings
from tavily import TavilyClient
import trafilatura

settings = Settings()
tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)



class SearchService:
    def web_search(self, query: str):
        results = []
        response = tavily_client.search(query, max_results=5)
        search_results = response.get("results", [])
        for item in search_results:
            downloaded = trafilatura.fetch_url(item.get("url"))
            content = trafilatura.extract(downloaded, include_comments=False) if downloaded else None

            results.append({
                "title": item.get("title", ""),
                "url": item.get("url"),
                "content": content or "",
            })

        return results
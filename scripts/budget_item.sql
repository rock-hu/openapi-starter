--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: budget_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_item (
    budget_id character varying(20) NOT NULL,
    budget_item_seq_id character varying(20) NOT NULL,
    budget_item_type_id character varying(20),
    amount numeric(18,2),
    purpose character varying(255),
    justification character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_item OWNER TO ofbiz;

--
-- Name: budget_item pk_budget_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_item
    ADD CONSTRAINT pk_budget_item PRIMARY KEY (budget_id, budget_item_seq_id);


--
-- Name: bdgtitm_to_bdgt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgtitm_to_bdgt ON budget_item USING btree (budget_id);


--
-- Name: budget_item_btyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_item_btyp ON budget_item USING btree (budget_item_type_id);


--
-- Name: budget_item_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_item_txcrts ON budget_item USING btree (created_tx_stamp);


--
-- Name: budget_item_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_item_txstmp ON budget_item USING btree (last_updated_tx_stamp);


--
-- Name: budget_item bdgtitm_to_bdgt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_item
    ADD CONSTRAINT bdgtitm_to_bdgt FOREIGN KEY (budget_id) REFERENCES budget(budget_id);


--
-- Name: budget_item budget_item_btyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_item
    ADD CONSTRAINT budget_item_btyp FOREIGN KEY (budget_item_type_id) REFERENCES budget_item_type(budget_item_type_id);


--
-- PostgreSQL database dump complete
--


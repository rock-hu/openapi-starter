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
-- Name: sales_opportunity_history; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE sales_opportunity_history (
    sales_opportunity_history_id character varying(20) NOT NULL,
    sales_opportunity_id character varying(20),
    description text,
    next_step text,
    estimated_amount numeric(18,2),
    estimated_probability numeric(18,6),
    currency_uom_id character varying(20),
    estimated_close_date timestamp with time zone,
    opportunity_stage_id character varying(20),
    change_note text,
    modified_by_user_login character varying(255),
    modified_timestamp timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.sales_opportunity_history OWNER TO ofbiz;

--
-- Name: sales_opportunity_history pk_sales_opportunity_history; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_history
    ADD CONSTRAINT pk_sales_opportunity_history PRIMARY KEY (sales_opportunity_history_id);


--
-- Name: slophi_crncy_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slophi_crncy_uom ON sales_opportunity_history USING btree (currency_uom_id);


--
-- Name: slophi_slsopp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slophi_slsopp ON sales_opportunity_history USING btree (sales_opportunity_id);


--
-- Name: slophi_stage; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slophi_stage ON sales_opportunity_history USING btree (opportunity_stage_id);


--
-- Name: slophi_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slophi_usrlgn ON sales_opportunity_history USING btree (modified_by_user_login);


--
-- Name: sls_opprt_hsr_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprt_hsr_txcs ON sales_opportunity_history USING btree (created_tx_stamp);


--
-- Name: sls_opprt_hsr_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprt_hsr_txsp ON sales_opportunity_history USING btree (last_updated_tx_stamp);


--
-- Name: sales_opportunity_history slophi_crncy_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_history
    ADD CONSTRAINT slophi_crncy_uom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: sales_opportunity_history slophi_slsopp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_history
    ADD CONSTRAINT slophi_slsopp FOREIGN KEY (sales_opportunity_id) REFERENCES sales_opportunity(sales_opportunity_id);


--
-- Name: sales_opportunity_history slophi_stage; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_history
    ADD CONSTRAINT slophi_stage FOREIGN KEY (opportunity_stage_id) REFERENCES sales_opportunity_stage(opportunity_stage_id);


--
-- Name: sales_opportunity_history slophi_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_history
    ADD CONSTRAINT slophi_usrlgn FOREIGN KEY (modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

